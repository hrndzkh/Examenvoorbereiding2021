<!DOCTYPE html>
<head>
    <metacharset="UTF-8">
    <metaname="viewport"content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <div class="content">
    <form name="loginEmployee" method="POST" action="">
        <p id="page_title">Login as an employee</p>
        <input required type="email" name="username" placeholder="Enter your username" /><br>
        <input required type="password" name="pwd" placeholder="Enter your password" /><br>
        <input type="submit" value="login">
    </form>
    </div>
    <?php
    if(isset($_POST["submit"])) {
        $melding = "";
        $email = htmlspecialchars($_POST["username"]);
        $password = htmlspecialchars($_POST["pwd"]);
        try {
            $sql = "SELECT * FROM medewerker WHERE Gebruikersnaam = ?";
            $stmt = $verbinding->prepare($sql);
            $stmt->execute(array($username));
            $resultaat = $stmt->fetch(PDO::FETCH_ASSOC);
            if($resultaat) {
                $passwordInDatabase = $resultaat["pwd"];
                if(password_verify($password,$passwordInDatabase)){
                    $_SESSION["E-MAIL"] = $resultaat("username");
                }else{
                    $melding .= "Please try again<br>";
                }
            }else{
                $melding .= "Please try again<br>";
            }
        }catch(PDOException $e) {
            echo $e->getMessage();
        }
            echo "<div id='melding'>$melding</div>";
    }
    ?>
</body>
</html>
