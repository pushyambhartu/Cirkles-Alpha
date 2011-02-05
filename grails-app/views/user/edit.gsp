

<%@ page import="cirkles.alpha.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="user.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="40" value="${userInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="salt"><g:message code="user.salt.label" default="Salt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'salt', 'errors')}">
                                    <g:textField name="salt" maxlength="40" value="${userInstance?.salt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" maxlength="40" value="${userInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cirkle"><g:message code="user.cirkle.label" default="Cirkle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'cirkle', 'errors')}">
                                    <g:select name="cirkle.id" from="${cirkles.alpha.Cirkle.list()}" optionKey="id" value="${userInstance?.cirkle?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bookCount"><g:message code="user.bookCount.label" default="Book Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bookCount', 'errors')}">
                                    <g:textField name="bookCount" value="${fieldValue(bean: userInstance, field: 'bookCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="books"><g:message code="user.books.label" default="Books" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'books', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.books?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="book" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shelfCount"><g:message code="user.shelfCount.label" default="Shelf Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'shelfCount', 'errors')}">
                                    <g:textField name="shelfCount" value="${fieldValue(bean: userInstance, field: 'shelfCount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shelfs"><g:message code="user.shelfs.label" default="Shelfs" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'shelfs', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.shelfs?}" var="s">
    <li><g:link controller="shelf" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="shelf" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shelf.label', default: 'Shelf')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
