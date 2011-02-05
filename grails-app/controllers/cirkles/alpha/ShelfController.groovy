package cirkles.alpha

class ShelfController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shelfInstanceList: Shelf.list(params), shelfInstanceTotal: Shelf.count()]
    }

    def create = {
        def shelfInstance = new Shelf()
        shelfInstance.properties = params
        return [shelfInstance: shelfInstance]
    }

    def save = {
        def shelfInstance = new Shelf(params)
        if (shelfInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shelf.label', default: 'Shelf'), shelfInstance.id])}"
            redirect(action: "show", id: shelfInstance.id)
        }
        else {
            render(view: "create", model: [shelfInstance: shelfInstance])
        }
    }

    def show = {
        def shelfInstance = Shelf.get(params.id)
        if (!shelfInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shelfInstance: shelfInstance]
        }
    }

    def edit = {
        def shelfInstance = Shelf.get(params.id)
        if (!shelfInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shelfInstance: shelfInstance]
        }
    }

    def update = {
        def shelfInstance = Shelf.get(params.id)
        if (shelfInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shelfInstance.version > version) {
                    
                    shelfInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shelf.label', default: 'Shelf')] as Object[], "Another user has updated this Shelf while you were editing")
                    render(view: "edit", model: [shelfInstance: shelfInstance])
                    return
                }
            }
            shelfInstance.properties = params
            if (!shelfInstance.hasErrors() && shelfInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shelf.label', default: 'Shelf'), shelfInstance.id])}"
                redirect(action: "show", id: shelfInstance.id)
            }
            else {
                render(view: "edit", model: [shelfInstance: shelfInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shelfInstance = Shelf.get(params.id)
        if (shelfInstance) {
            try {
                shelfInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])}"
            redirect(action: "list")
        }
    }
}
