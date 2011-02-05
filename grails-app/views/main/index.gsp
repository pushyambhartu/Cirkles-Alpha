<html>
<head>
  <title>Cirkles - Homepage</title>
  <meta name="layout" content="main" />
</head>
<body>
<g:if test="${session?.user}">
</g:if>
<g:else>
  <g:form class="simpleform" style="width:50%;" url="[controller:'user',action:'login']">
    <fieldset>
      <legend>Login</legend>
      <p class="info">
        Please login with your username and password. <br />
        Don't have an account?
        <g:link controller="user" action="create">Sign up now!</g:link>
      </p>
      <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
      </g:if>
      <label for="username">Username</label>
      <div class="rightcol">
        <g:textField name="name" />
      </div>
      <label for="password">Password</label>
      <div class="rightcol">
        <g:passwordField name="password" />
      </div>
      <label>&nbsp;</label>
      <div class="rightcol">
        <g:submitButton class="button" name="submitButton" value="Login" />
      </div>
    </fieldset>
  </g:form>
</g:else>
</body>
</html>
