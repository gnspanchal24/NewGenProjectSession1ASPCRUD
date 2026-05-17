<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="NewGenProjectSession1ASPCRUD.UserRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .input-group {
            position: relative;
            margin-bottom: 15px;
        }

        .input-group i {
            position: absolute;
            top: 12px;
            left: 10px;
            color: #888;
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .input-group input:focus {
            border-color: #4facfe;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #4facfe, #00c6ff);
            border: none;
            color: white;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
        }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }

        #gvUserInfo {
            margin-top: 25px;
            width: 100%;
            border-collapse: collapse;
        }

        #gvUserInfo th {
            background: #0072ff;
            color: white;
            padding: 10px;
        }

        #gvUserInfo td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        #gvUserInfo tr:hover {
            background: #f1f9ff;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h2>User Registration</h2>

            <!-- Username -->
            <div class="input-group">
                <i class="fa fa-user"></i>
                <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter User Name"></asp:TextBox>
            </div>

            <!-- Age -->
            <div class="input-group">
                <i class="fa fa-calendar"></i>
                <asp:TextBox ID="txtAge" runat="server" placeholder="Enter Age"></asp:TextBox>
            </div>

            <!-- Gender -->
            <div class="input-group">
                <i class="fa fa-venus-mars"></i>
                <asp:TextBox ID="txtGender" runat="server" placeholder="Enter Gender"></asp:TextBox>
            </div>

            <!-- Mobile -->
            <div class="input-group">
                <i class="fa fa-phone"></i>
                <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile Number"></asp:TextBox>
            </div>

            <!-- Email -->
            <div class="input-group">
                <i class="fa fa-envelope"></i>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
            </div>

            <!-- Button -->
            <asp:Button ID="btnInsert" runat="server" Text="Register" CssClass="btn" OnClick="btnInsert_Click" />

            <!-- Message -->
            <asp:Label ID="lblMessage" runat="server" />

            <!-- Grid -->
            <asp:GridView ID="gvUserInfo" runat="server"></asp:GridView>

        </div>
    </form>
</body>
</html>