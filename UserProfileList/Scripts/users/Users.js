var app = angular.module("Users", []);
app.controller("Userscontroller", function ($scope, $http) {
    $scope.filteredUsers = [];
    $scope.currentPage = 1;
    $scope.numPerPage = 5;
    $scope.maxsize = 12;
    $scope.Pages = [];
    $scope.TotalPages = 0;
    $scope.Userslist = [];
    $scope.UsersFullDetails = [];
    $http({
        method: 'GET',
        url: 'https://dummyapi.io/data/v1/user?limit=50',
        headers: {
            'app-id': '61626ff9fed019a5e6600384'
        },
    }).then(function successcallBack(response) {
        $scope.UserList = response.data.data;
        let individualUserResponses = []
        angular.forEach($scope.UserList, function (user, key) {
            individualUserResponses.push(
                $http({
                    method: 'GET',
                    url: 'https://dummyapi.io/data/v1/user/' + user.id,
                    headers: {
                        'app-id': '61626ff9fed019a5e6600384'
                    },
                })
            );

        });
        Promise.all(individualUserResponses).then(() => {
            angular.forEach(individualUserResponses, function (response, key) {
                $scope.UsersFullDetails.push(response.$$state.value.data);
            })

            $scope.TotalPages = $scope.UsersFullDetails.length / $scope.numPerPage;
            for (var i = 0; i <= $scope.TotalPages - 1; i++) {
                $scope.Pages.push(i + 1);
            }
            var begin = (($scope.currentPage - 1) * $scope.numPerPage)
            var end = begin + $scope.numPerPage;
            $scope.filteredUsers = $scope.UsersFullDetails.slice(begin, end);
            $scope.$apply();
            document.getElementById("progress").style.display = "none";
        }
        )
    }, function errorcallback(response) {

    });
    $scope.filterPage = function (num) {
        var begin = ((num - 1) * $scope.numPerPage);
        var end = begin + $scope.numPerPage;
        $scope.filteredUsers = $scope.UsersFullDetails.slice(begin, end);
    }
})