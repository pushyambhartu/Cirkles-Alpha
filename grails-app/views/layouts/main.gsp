<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'pop.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
</head>
<body>
  <div id="wrapper">

    <!-- header picture -->
    <div id="header">
    <h1>Cirkles</h1>
    </div> <!-- END #header -->

    <!-- username | logout link -->
    <g:if test="${session?.user}">
      <div id="login">
        ${session?.user?.name} |
        <g:link controller="user" action="logout">Logout</g:link>
      </div> <!-- END #login -->
    </g:if>



    <div id="nav">
         <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	    <span class="menuButton"><a class="home" href="${createLink(uri: '/book/list')}">Books</a></span>
	    <span class="menuButton"><a class="home" href="${createLink(uri: '/shelf/list')}">Shelves</a></span>   
    </div> <!-- END #nav -->

    <div id="content">
      <g:layoutBody />
    </div> <!-- END #content -->

    <div id="footer">

    </div> <!-- END #footer -->

  </div> <!-- END #wrapper -->
</body>
</html>
