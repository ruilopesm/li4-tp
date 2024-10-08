using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using OnlineAuctions.Data.Models;
using System.Security.Claims;

namespace OnlineAuctions.Auth
{
    public class AuthProvider : AuthenticationStateProvider
    {
        private readonly ProtectedSessionStorage _storage;
        private readonly ClaimsPrincipal _anonymous = new(new ClaimsIdentity());
        
        public AuthProvider(ProtectedSessionStorage storage)
        {
            _storage = storage;
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            try
            {
                var userSessionResult = await _storage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionResult.Success ? userSessionResult.Value : null;
                if (userSession == null)
                {
                    return await Task.FromResult(new AuthenticationState(_anonymous));
                }

                var claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new(ClaimTypes.Email, userSession.Email),
                    new(ClaimTypes.Role, userSession.Role)
                }, "CustomAuth"));
                return await Task.FromResult(new AuthenticationState(claimsPrincipal));
            }
            catch
            {
                return await Task.FromResult(new AuthenticationState(_anonymous));
            }
        }

        public async Task UpdateAuthenticationState(UserSession? userSession)
        {
            ClaimsPrincipal claimsPrincipal;

            if (userSession != null)
            {
                await _storage.SetAsync("UserSession", userSession);
                claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new(ClaimTypes.Email, userSession.Email),
                    new(ClaimTypes.Role, userSession.Role)
                }, "CustomAuth"));
            } else
            {
                await _storage.DeleteAsync("UserSession");
                claimsPrincipal = _anonymous;
            }

            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }

        public async Task Logout()
        {
            await UpdateAuthenticationState(null);
        }

        public async Task<bool> IsAuthenticated()
        {
            try
            {
                var userSessionResult = await _storage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionResult.Success ? userSessionResult.Value : null;
                return userSession != null;
            }
            catch
            {
                return false;
            }
        }

        public async Task<string?> GetEmail()
        {
            try
            {
                var userSessionResult = await _storage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionResult.Success ? userSessionResult.Value : null;

                return userSession?.Email;
            }
            catch
            {
                return null;
            }
        }

        public async Task<string?> GetRole()
        {
            try
            {
                var userSessionResult = await _storage.GetAsync<UserSession>("UserSession");
                var userSession = userSessionResult.Success ? userSessionResult.Value : null;

                return userSession?.Role;
            }
            catch
            {
                return null;
            }
        }
    }
}
