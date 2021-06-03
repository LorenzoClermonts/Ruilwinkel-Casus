﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Ruilwinkel.AllProductsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="position:absolute; top: 15%">
        <h1>
        
            Producten</h1>
        <div style="padding: 10px;">
            <h2>Filter status</h2>
            <asp:DropDownList ID="DropDownListStatus" runat="server" AutoPostBack="true" DataMember="SqlDataSource1"
                DataTextField="Status" DataValueField="Status" AppendDataBoundItems="true">
                <asp:ListItem Text="Alle" Value="" />
                <asp:ListItem Text="Beschikbaar" Value="True" />
                <asp:ListItem Text="Uitgeleend" Value="False"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="padding: 10px";>
            <h2>Filter categorie</h2>
            <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CATEGORYNAME" DataValueField="CATEGORYNAME">
            </asp:CheckBoxList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ruilwinkelConnectionString %>" SelectCommand="SELECT [CATEGORYNAME] FROM [CATEGORY]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ruilwinkelConnectionString %>" SelectCommand="SELECT PRODUCT.PRODUCTNAME, PRODUCT.DESCRIPTION, CATEGORY.CATEGORYNAME, ARTICLE.STATUS, [USER].FIRSTNAME, [USER].LASTNAME FROM PRODUCT INNER JOIN ARTICLE ON PRODUCT.ID = ARTICLE.PRODUCTID INNER JOIN CATEGORY ON PRODUCT.CATEGORYID = CATEGORY.ID INNER JOIN [USER] ON ARTICLE.PROVIDERID = [USER].ID AND ARTICLE.RENTERID = [USER].ID"
            FilterExpression="STATUS = '{0}'">
            <FilterParameters>
                <asp:ControlParameter Name="STATUS" ControlID="DropDownListStatus" PropertyName="SelectedValue" />
            </FilterParameters>
        </asp:SqlDataSource>
        <asp:Button ID="BTNOK" runat="server" OnClick="BTNOK_Click" Text="Button" />
        <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="PRODUCTNAME" HeaderText="PRODUCTNAME" SortExpression="PRODUCTNAME" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="CATEGORYNAME" HeaderText="CATEGORYNAME" SortExpression="CATEGORYNAME" />
                <asp:CheckBoxField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRSTNAME" SortExpression="FIRSTNAME" />
                <asp:BoundField DataField="LASTNAME" HeaderText="LASTNAME" SortExpression="LASTNAME" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
    
    
    
    
    
</asp:Content>
