<html>
<head><title>HOME</title></head>
<?php
if($_SERVER["REQUEST_METHOD"]=="POST")
{
if(isset($_POST["sname"]))
{
$ne=strtoupper($_POST["name"]);
$f=fopen("name.txt","w") or die("faild");
fwrite($f,$ne);
fclose($f);
$f=fopen("name.txt","r") or die("faild");
$ne=strtoupper(fread($f,filesize("name.txt")));
fclose($f);
$f=fopen("light1.txt","r") or die("faild");
$s=fread($f,filesize("light1.txt"));
fclose($f);
$f=fopen("light2.txt","r") or die("faild");
$s2=fread($f,filesize("light2.txt"));
fclose($f);
$f=fopen("light3.txt","r") or die("faild");
$s3=fread($f,filesize("light3.txt"));
fclose($f);
$f=fopen("fan.txt","r") or die("faild");
$s4=fread($f,filesize("fan.txt"));
fclose($f);
}
else
{
$f=fopen("name.txt","r") or die("faild");
$ne=strtoupper(fread($f,filesize("name.txt")));
fclose($f);
$f=fopen("light1.txt","r") or die("faild");
$s=fread($f,filesize("light1.txt"));
fclose($f);
$f=fopen("light2.txt","r") or die("faild");
$s2=fread($f,filesize("light2.txt"));
fclose($f);
$f=fopen("light3.txt","r") or die("faild");
$s3=fread($f,filesize("light3.txt"));
fclose($f);
$f=fopen("fan.txt","r") or die("faild");
$s4=fread($f,filesize("fan.txt"));
fclose($f);
if(isset($_POST["b1"]))
{
if($s=="light1 off")
{
$s="light1 on";
}
else if($s=="light1 on")
{
$s="light1 off";
}
$f=fopen("light1.txt","w") or die("faild");
fwrite($f,$s);
fclose($f);
}
else if(isset($_POST["b2"]))
{
if($s2=="light2 on")
{
$s2="light2 off";
}
else if($s2=="light2 off")
{
$s2="light2 on";
}
$f=fopen("light2.txt","w") or die("faild");
fwrite($f,$s2);
fclose($f);
}
else if(isset($_POST["b3"]))
{
if($s3=="light3 on")
{
$s3="light3 off";
}
else if($s3=="light3 off")
{
$s3="light3 on";
}
$f=fopen("light3.txt","w") or die("faild");
fwrite($f,$s3);
fclose($f);
}
else if(isset($_POST["b4"]))
{
if($s4=="fan on")
{
$s4="fan off";
}
else if($s4=="fan off")
{
$s4="fan on";
}
$f=fopen("fan.txt","w") or die("faild");
fwrite($f,$s4);
fclose($f);
}
}
}
?>
</center>
<body bgcolor="yellow">
<center>
<h1><b>WELLCOME <?php echo $ne;?> IN YOUR HOME</b></h1>
<form action="mainprog.php" method="post">
<h2><b><u>BUTTONS</u></b></h2><br>
<input type="submit" name="b1" value="<?php echo $s;?>"><br><br>
<input type="submit" name="b2" value="<?php echo $s2;?>"><br><br>
<input type="submit" name="b3" value="<?php echo $s3;?>"><br><br>
<input type="submit" name="b4" value="<?php echo $s4;?>">
<form>
</center>
</body>
</html>