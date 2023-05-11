using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Default2 : System.Web.UI.Page
{
    String database = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            derecord();
        }
       

    }

    protected void save_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(database);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into pro (ProductName,ProductID,CategoryID,CategoryName) values('"+proname.Text.Trim()+ "','" + proid.Text.Trim() + "','" + carid.Text.Trim()+"','"+catname.Text.Trim()+"')";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
        derecord();
    }




    void derecord()
    {
        SqlConnection con = new SqlConnection(database);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select ProductID,ProductName,CategoryID,CategoryName from pro";
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        datagrid.DataSource = dt;
        datagrid.DataBind();
        con.Close();
        cmd.Dispose();
        da.Dispose();

    }

    protected void datagrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label pid = datagrid.Rows[e.RowIndex].FindControl("Proid") as Label;
        TextBox  cid= datagrid.Rows[e.RowIndex].FindControl("Carid") as TextBox;
        TextBox pname = datagrid.Rows[e.RowIndex].FindControl("Proname") as TextBox;
        TextBox cname = datagrid.Rows[e.RowIndex].FindControl("Catname") as TextBox;
        SqlConnection con = new SqlConnection(database);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Update pro set ProductName='" + pname.Text + "', CategoryID ='" + cid.Text + "',CategoryName ='" + cname.Text + "' where ProductID ='" + pid.Text + "' ";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        datagrid.EditIndex = -1;
        derecord();
    }

    protected void datagrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DEL")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            Label pid = datagrid.Rows[i].FindControl("Proid") as Label;

            SqlConnection con = new SqlConnection(database);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from pro where ProductID='"+pid.Text+"' ";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            datagrid.EditIndex = -1;
            derecord();

        }
    }
    protected void datagrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        datagrid.EditIndex = e.NewEditIndex;
        derecord();
    }

    protected void datagrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        datagrid.EditIndex = -1;
        derecord();
    }
}