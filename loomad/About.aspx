<%@ Page Title="Loomade tabel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="loomad.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Sisestatud loomade andmed.</h3>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="loomID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical" Height="149px" Width="918px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
            <asp:BoundField DataField="loomanimi" HeaderText="loomanimi" SortExpression="loomanimi" />
            <asp:BoundField DataField="synniaeg" HeaderText="synniaeg" SortExpression="synniaeg" />
            <asp:BoundField DataField="omanikID" HeaderText="omanikID" SortExpression="omanikID" />
            <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudlinkConnectionString1 %>" DeleteCommand="DELETE FROM [looma] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [looma] ([loomanimi], [synniaeg], [omanikID]) VALUES (@loomanimi, @synniaeg, @omanikID)" SelectCommand="SELECT looma.loomID, looma.loomanimi, looma.synniaeg, looma.omanikID, omanik.nimi, omanik.telefon FROM looma INNER JOIN omanik ON looma.omanikID = omanik.omanikID" UpdateCommand="UPDATE [looma] SET [loomanimi] = @loomanimi, [synniaeg] = @synniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
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
</asp:Content>
