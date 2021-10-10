<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UserProfileList.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/users/Users.js"></script>
    <link href="Content/users/Users.css" rel="stylesheet" />
</head>
<body ng-app="Users" ng-controller="Userscontroller">
    <form id="form1" runat="server">
        <div>
            <div id="progress">
                <p style="padding-left:270px;padding-top:50px;">Loading........</p>
                <img style="height:250px;width:250px;position:absolute;top:102px;z-index:9999;left:326px;" src="Images/loader.gif" />
            </div>
            <ul class="pagination" style="padding-left:76px;cursor:pointer;">
                <li ng-repeat="page in Pages">
                    <a ng-click="filterPage(page)">{{page}} </a>
                </li>
            </ul>
        </div>
        <section>
            <div class="container">
                <div ng-repeat="user in filteredUsers">
                    <div class="col-md-12">
    		    <div class="card profile-card-3">
    		        <div class="background-block">
    		            <img src="https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="profile-sample1" class="background"/>
    		        </div>
    		        <div class="profile-thumb-block">
    		            <img ng-src="{{user.picture}}" alt="profile-image" class="profile"/>
    		        </div>
    		        <div class="card-content">
                    <p>ID : {{user.id}}</p>
                    <table class="table table-borderless">
                        <tr>
                            <th>
                                <h3>{{user.title+' '+user.firstName+' '+user.lastName}}</h3>
                            </th>
                            <th>
                                Address
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <table class="table table-borderless">
<tr>

    <td> Gender :</td>
    <td>{{user.gender}}</td>
    </tr>
    <tr>
    <td>Date of birth :</td>
    <td>{{user.dateOfBirth}}</td>
        </tr>
    <tr>
    <td>Register Date</td>
    <td>{{user.registerDate}}</td>
       </tr> 
    <tr>
    <td>Email :</td>
        
    <td>{{user.email}}</td>
        </tr>
    <tr>
    <td>Phone :</td>
    <td>{{user.phone}}</td>
        </tr>


                                </table>
                            </td>
                            <td>
                                <table class="table table-borderless">
                                    <tr>
                                        <td>
                                            state :
                                        </td>
                                        <td>{{user.location.state}}</td>
                                        </tr>
                                    <tr>
                                        <td>street :</td>
                                        <td>{{user.location.street}}</td>
                                        </tr>
                                    <tr>
                                        <td>city</td>
                                        <td>{{user.location.city}}</td>
                                        </tr>
                                    <tr>
                                        <td>country :</td>
                                        <td>{{user.location.country}}</td>
                                        </tr>
                                    <tr>
                                        <td>Time Zone :</td>
                                        <td>{{user.location.timezone}}</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    </div>
                </div>
                
    		</div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
