
<%@ page import="cirkles.alpha.Shelf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shelf.label', default: 'Shelf')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'shelf.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'shelf.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'shelf.description.label', default: 'Description')}" />
                        
                            <th><g:message code="shelf.user.label" default="User" /></th>
                        
                            <g:sortableColumn property="bookCount" title="${message(code: 'shelf.bookCount.label', default: 'Book Count')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'shelf.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shelfInstanceList}" status="i" var="shelfInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shelfInstance.id}">${fieldValue(bean: shelfInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shelfInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: shelfInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: shelfInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: shelfInstance, field: "bookCount")}</td>
                        
                            <td><g:formatDate date="${shelfInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shelfInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
