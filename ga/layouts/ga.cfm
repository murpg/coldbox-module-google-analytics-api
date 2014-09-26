<cfprocessingdirective pageencoding="utf-8" />
<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><cfoutput><cfif isdefined('session.site')>#session.site#</cfif></cfoutput> Web Stats</title>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1/themes/blitzer/jquery-ui.css" />
<link rel="stylesheet" href="//jensbits.com/demos/bootstrap/css/bootstrap.min.css" />
<style>body {padding-top: 60px;}.float_right{float:right}</style>
<link rel="stylesheet" href="//jensbits.com/demos/bootstrap/css/bootstrap-responsive.min.css" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script src="#event.getModuleRoot()#/includes/js/util.js"></script>
</head>

<body>

<div class="container">

     	#renderView()#	

    </div>
</body>
</html>

</cfoutput>
		