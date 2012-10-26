<?PHP
ini_set('display_errors', true);
error_reporting(E_ALL & ~E_DEPRECATED);

$localhost = '192.168.0.120'; //name of server. Usually localhost
$database = 'sound'; //database name.
$username = 'root'; //database username.
$password = 'access'; //database password.

$conn = mysql_connect($localhost, $username, $password) or die('Error connecting to mysql');   
$db = mysql_select_db($database,$conn) or die('Unable to select database!');    
?>