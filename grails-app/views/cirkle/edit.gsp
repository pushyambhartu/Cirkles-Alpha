

<%@ page import="cirkles.alpha.Cirkle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cirkle.label', default: 'Cirkle')}" />
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
            <g:hasErrors bean="${cirkleInstance}">
            <div class="errors">
                <g:renderErrors bean="${cirkleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cirkleInstance?.id}" />
                <g:hiddenField name="version" value="${cirkleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="cirkle.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cirkleInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="100" value="${cirkleInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="cirkle.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cirkleInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${cirkleInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="cirkle.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cirkleInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${cirkleInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="users"><g:message code="cirkle.users.label" default="Users" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cirkleInstance, field: 'users', 'errors')}">
                                    
<ul>
<g:each in="${cirkleInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="user" action="create" params="['cirkle.id': cirkleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>

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
