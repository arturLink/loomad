<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="loomad.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>Loomad lisamine</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="loomID" DataSourceID="SqlDataSource1_Loomad" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
                <asp:BoundField DataField="loomanimi" HeaderText="loomanimi" SortExpression="loomanimi" />
                <asp:TemplateField HeaderText="synniaeg" SortExpression="synniaeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("synniaeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
                        <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("synniaeg") %>'></asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("synniaeg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="omanikID" SortExpression="omanikID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("omanikID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1_Omanik" DataTextField="nimi" DataValueField="omanikID" SelectedValue='<%# Bind("omanikID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_Omanik" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudlinkConnectionString1 %>" SelectCommand="SELECT [omanikID], [nimi] FROM [omanik]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("omanikID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1_Loomad" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudlinkConnectionString1 %>" DeleteCommand="DELETE FROM [looma] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [looma] ([loomanimi], [synniaeg], [omanikID]) VALUES (@loomanimi, @synniaeg, @omanikID)" SelectCommand="SELECT * FROM [looma]" UpdateCommand="UPDATE [looma] SET [loomanimi] = @loomanimi, [synniaeg] = @synniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
            <DeleteParameters>
                <asp:Parameter Name="loomID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="synniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
                <asp:Parameter Name="loomID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    &nbsp;
</asp:Content>
