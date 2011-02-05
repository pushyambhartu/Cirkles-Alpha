

<%@ page import="cirkles.alpha.Shelf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shelf.label', default: 'Shelf')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shelfInstance}">
            <div class="errors">
                <g:renderErrors bean="${shelfInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="shelf.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shelfInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="40" value="${shelfInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="shelf.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shelfInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${shelfInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="shelf.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shelfInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${cirkles.alpha.User.list()}" optionKey="id" value="${shelfInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bookCount"><g:message code="shelf.bookCount.label" default="Book Count" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shelfInstance, field: 'bookCount', 'errors')}">
                                    <g:textField name="bookCount" value="${fieldValue(bean: shelfInstance, field: 'bookCount')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
