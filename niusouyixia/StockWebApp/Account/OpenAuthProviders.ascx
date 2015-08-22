<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="StockWebApp.Account.OpenAuthProviders" %>

<fieldset class="open-auth-providers">
    <legend>使用其他服务登录</legend>
    
    <asp:ListView runat="server" ID="providerDetails" ItemType="Microsoft.AspNet.Membership.OpenAuth.ProviderDetails"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <button type="submit" name="provider" value="<%#: Item.ProviderName %>"
                title="使用你的 <%#: Item.ProviderDisplayName %> 帐户登录。">
                <%#: Item.ProviderDisplayName %>
            </button>
        </ItemTemplate>
    
        <EmptyDataTemplate>
            <div class="message-info">
                <p>未配置外部身份验证服务。请参见<a href="http://go.microsoft.com/fwlink/?LinkId=252803">此文章</a>，以详细了解如何将此 ASP.NET 应用程序设置为支持通过外部服务登录。</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</fieldset>