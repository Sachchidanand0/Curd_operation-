<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <style>
        .top{
            width:100vw;
            display:flex;
            justify-content:space-around;
        }
        .first{
            width:100vw;
            height:100vh;
        }
        .btn{
            width:auto;
            
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server"></asp:ScriptManager>
        <main class="top">
        <div class="first card card-body">
            <asp:Label runat="server"  ID="Pro">ProductId</asp:Label>
            <asp:TextBox runat="server" ID="proid"></asp:TextBox>
           
            <asp:Label runat="server"  ID="Label1">ProductName</asp:Label>
                <asp:TextBox runat="server" ID="proname"></asp:TextBox>
            <asp:Label runat="server"  ID="Label2">CategoryId</asp:Label>
                <asp:TextBox runat="server" ID="carid"></asp:TextBox>
            <asp:Label runat="server"  ID="Label3">CategoryName</asp:Label>
               <asp:TextBox runat="server" ID="catname"></asp:TextBox>
            <br /><br />
            <asp:Button  runat="server" Text="Save" ID="save" class="btn btn-group-lg btn-danger" OnClick="save_Click"/>
           
        </div>
        <div class="card card-body w-100 h-100">
            <asp:GridView ID="datagrid" runat="server" class="table table-striped table-bordered w-auto h-auto mt-5 ms-5" EmptyDataText="Record not found" AutoGenerateColumns="false" AllowPaging="true" PageSize="25" OnRowUpdating="datagrid_RowUpdating" OnRowCommand="datagrid_RowCommand" OnRowEditing="datagrid_RowEditing" OnRowCancelingEdit="datagrid_RowCancelingEdit" >
                <Columns>
                    <asp:TemplateField HeaderText="Update / Delete">
                                      <ItemTemplate>
                                          <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-primary btn-sm" ValidationGroup="ch1" />  
                                                                    <asp:Button ID="btn_Del" runat="server" Text="Delete" CommandName="DEL" CssClass="btn btn-primary btn-sm"  CommandArgument="<%# Container.DisplayIndex %>"   />  
                                      </ItemTemplate>
                                      <EditItemTemplate>
                                               <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary btn-sm" ValidationGroup="ch1"/>  
                                                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary btn-sm"/>  
                                      </EditItemTemplate>
                                  </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label runat="server"  ID="Proid" Text='<%#Eval("ProductID") %>'></asp:Label>
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate><asp:TextBox runat="server" ID="Proname" Text='<%#Eval("ProductName") %>'></asp:TextBox></EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CategoryID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate><asp:TextBox runat="server" ID="Carid" Text='<%#Eval("CategoryID") %>'></asp:TextBox></EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate><asp:TextBox runat="server" ID="Catname" Text='<%#Eval("CategoryName") %>'></asp:TextBox></EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
            </main>
    </form>
</body>
</html>
