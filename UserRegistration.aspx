<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="NewGenProjectSession1ASPCRUD.UserRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1f4037, #99f2c8);
            margin: 0;
        }

        /* Layout */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            display: grid;
            grid-template-columns: 450px 1fr;
            gap: 25px;
        }

        /* Cards */
        .form-card, .grid-card {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        /* Title */
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Input */
        .input-group {
            margin-bottom: 18px;
        }

            .input-group label {
                display: block;
                margin-bottom: 6px;
                font-weight: 500;
                color: #444;
            }

            .input-group input {
                width: 100%;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #ccc;
                transition: 0.3s;
            }

                .input-group input:focus {
                    border-color: #00b894;
                    box-shadow: 0 0 6px rgba(0,184,148,0.4);
                    outline: none;
                }

        /* 🔥 Modern Gender Buttons */
        .gender-group {
            display: flex;
            gap: 10px;
        }

            .gender-group input {
                display: none;
            }

            .gender-group label {
                padding: 8px 15px;
                border: 1px solid #00b894;
                border-radius: 20px;
                cursor: pointer;
                transition: 0.3s;
                color: #00b894;
            }

            .gender-group input:checked + label {
                background: #00b894;
                color: white;
            }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: linear-gradient(135deg, #00b894, #00cec9);
            color: white;
            font-size: 15px;
            margin-top: 10px;
            cursor: pointer;
            transition: 0.3s;
        }

            .btn:hover {
                transform: translateY(-2px);
            }

        /* Message */
        .success {
            color: green;
        }

        .error {
            color: red;
        }

        /* Grid */
        .grid {
            width: 100%;
            border-collapse: collapse;
        }

            .grid th {
                background: #00b894;
                color: white;
                padding: 12px;
            }

            .grid td {
                padding: 10px;
                border-bottom: 1px solid #eee;
            }

            .grid tr:hover {
                background: #f1fffb;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <!-- FORM -->
            <div class="form-card">

                <h2>User Registration</h2>

                <div class="input-group">
                    <label>User Name</label>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </div>

                <div class="input-group">
                    <label>Age</label>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                </div>

                <div class="input-group">
                    <label>Gender</label>

                    <asp:RadioButtonList ID="rblGender" runat="server" CssClass="gender-group" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                    </asp:RadioButtonList>
                </div>

                <div class="input-group">
                    <label>Mobile</label>
                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="btnInsert" runat="server" Text="Register" CssClass="btn" OnClick="btnInsert_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" />

                <asp:Label ID="lblMessage" runat="server" />

            </div>

            <!-- GRID -->
            <div class="grid-card">
                <asp:GridView ID="gvUserInfo" runat="server" AutoGenerateColumns="false" CssClass="grid">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Name" />
                        <asp:BoundField DataField="Age" HeaderText="Age" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
