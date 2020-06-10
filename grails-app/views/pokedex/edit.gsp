<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pokedex.label', default: 'Pokedex')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-pokedex" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-pokedex" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.pokedex}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.pokedex}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.pokedex}" method="PUT">
                <fieldset class="form">
                    <div class="row">
                        <div class="col-8">
                            <div class="row">
                                <div class="form-group col-6">
                                    <label>Nome</label>
                                    <input type="text" name="name" class="form-control" value="${pokedex.name}" placeholder="Nome" required>
                                </div>

                                <div class="form-group col-3">
                                    <label>Vida</label>
                                    <input type="text" name="hp" class="form-control" value="${pokedex.hp}" placeholder="Vida" required>
                                </div>

                                <div class="form-group col-3">
                                    <label>Ataque</label>
                                    <input type="text" name="attack" class="form-control" value="${pokedex.attack}" placeholder="Ataque" required>
                                </div>

                                <div class="form-group col-6">
                                    <label>Defesa</label>
                                    <input type="text" name="defense" class="form-control" value="${pokedex.defense}" placeholder="Defesa" required>
                                </div>

                                <div class="form-group col-6">
                                    <label>Velocidade</label>
                                    <input type="text" name="speed" class="form-control" value="${pokedex.speed}" placeholder="Velocidade" required>
                                </div>

                                <div class="form-group col-6">
                                    <label>Velocidade de ataque</label>
                                    <input type="text" name="speed_attack" class="form-control" value="${pokedex.speed_attack}" placeholder="Velocidade de defesa" required>
                                </div>

                                <div class="form-group col-6">
                                    <label>Velocidade de defesa</label>
                                    <input type="text" name="speed_defense" class="form-control" value="${pokedex.speed_defense}" placeholder="Velocidade de defesa" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="row">
                                <div class="col-12">
                                    <label>Tipos</label>

                                    <select placeholder="Selecione..." multiple  name="types" class="form-control select2 select-2">
                                        <g:each var="type" in="${types}">
                                            <g:if test="${pokedex.types.find{it.id==type.id}}">
                                                <option selected value="${type.id}">${type.name}</option>
                                            </g:if>
                                            <g:else>
                                                <option value="${type.id}">${type.name}</option>
                                            </g:else>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>

        
    </body>


    
</html>
