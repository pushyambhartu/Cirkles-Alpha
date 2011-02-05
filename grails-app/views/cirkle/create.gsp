

<%@ page import="cirkles.alpha.Cirkle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cirkle.label', default: 'Cirkle')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cirkleInstance}">
            <div class="errors">
                <g:renderErrors bean="${cirkleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
