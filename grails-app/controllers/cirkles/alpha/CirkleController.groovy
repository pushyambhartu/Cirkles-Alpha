package cirkles.alpha

class CirkleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cirkleInstanceList: Cirkle.list(params), cirkleInstanceTotal: Cirkle.count()]
    }

    def create = {
        def cirkleInstance = new Cirkle()
        cirkleInstance.properties = params
        return [cirkleInstance: cirkleInstance]
    }

    def save = {
        def cirkleInstance = new Cirkle(params)
        if (cirkleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), cirkleInstance.id])}"
            redirect(action: "show", id: cirkleInstance.id)
        }
        else {
            render(view: "create", model: [cirkleInstance: cirkleInstance])
        }
    }

    def show = {
        def cirkleInstance = Cirkle.get(params.id)
        if (!cirkleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cirkleInstance: cirkleInstance]
        }
    }

    def edit = {
        def cirkleInstance = Cirkle.get(params.id)
        if (!cirkleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cirkleInstance: cirkleInstance]
        }
    }

    def update = {
        def cirkleInstance = Cirkle.get(params.id)
        if (cirkleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cirkleInstance.version > version) {
                    
                    cirkleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cirkle.label', default: 'Cirkle')] as Object[], "Another user has updated this Cirkle while you were editing")
                    render(view: "edit", model: [cirkleInstance: cirkleInstance])
                    return
                }
            }
            cirkleInstance.properties = params
            if (!cirkleInstance.hasErrors() && cirkleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), cirkleInstance.id])}"
                redirect(action: "show", id: cirkleInstance.id)
            }
            else {
                render(view: "edit", model: [cirkleInstance: cirkleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cirkleInstance = Cirkle.get(params.id)
        if (cirkleInstance) {
            try {
                cirkleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cirkle.label', default: 'Cirkle'), params.id])}"
            redirect(action: "list")
        }
    }
}
