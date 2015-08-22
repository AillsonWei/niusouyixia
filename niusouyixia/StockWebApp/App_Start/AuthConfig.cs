using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;

namespace StockWebApp
{
    internal static class AuthConfig
    {
        public static void RegisterOpenAuth()
        {
            // 请参见 http://go.microsoft.com/fwlink/?LinkId=252803，以详细了解如何将此 ASP.NET
            // 应用程序设置为支持通过外部服务登录。

            //OpenAuth.AuthenticationClients.AddTwitter(
            //    consumerKey: "你的 Twitter 使用者密钥",
            //    consumerSecret: "你的 Twitter 使用者密码");

            //OpenAuth.AuthenticationClients.AddFacebook(
            //    appId: "你的 Facebook 应用程序 ID",
            //    appSecret: "你的 Facebook 应用程序密码");

            //OpenAuth.AuthenticationClients.AddMicrosoft(
            //    clientId: "你的 Microsoft 帐户客户端 ID",
            //    clientSecret: "你的 Microsoft 帐户客户端密码");

            //OpenAuth.AuthenticationClients.AddGoogle();
        }
    }
}