package racetrack


class   RaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [raceInstanceList: Race.list(params), raceInstanceTotal: Race.count()]
    }

    def create = {
        def raceInstance = new Race()
        raceInstance.properties = params
        return [raceInstance: raceInstance]
    }

    def save = {
        def raceInstance = new Race(params)
        if (raceInstance.save(flush: true)) {
            flash.message = "${params.name} fue guardado corectamente."
            redirect(action: "show", id: raceInstance.id)
        }
        else {
            render(view: "create", model: [raceInstance: raceInstance])
        }
    }

    def show = {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
        else {
            [raceInstance: raceInstance]
        }
    }

    def edit = {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [raceInstance: raceInstance]
        }
    }

    def update = {
        def raceInstance = Race.get(params.id)
        if (raceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (raceInstance.version > version) {
                    
                    raceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'race.label', default: 'Race')] as Object[], "Another user has updated this Race while you were editing")
                    render(view: "edit", model: [raceInstance: raceInstance])
                    return
                }
            }
            raceInstance.properties = params
            if (!raceInstance.hasErrors() && raceInstance.save(flush: true)) {
                flash.message = "${params.name} fue actualizado."
                redirect(action: "show", id: raceInstance.id)
            }
            else {
                render(view: "edit", model: [raceInstance: raceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def raceInstance = Race.get(params.id)
        if (raceInstance) {
            try {
                raceInstance.delete(flush: true)
                flash.message = "El registro ${params.name} fue eliminado."
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
    }
    def search = {
        /** Este es el primer modo de realizarlo, sin utlizar el Hibernate Criteria Builder
        if (request.method == 'POST'){
            render(view:"list", model:[raceInstanceList: racetrack.Race.findAllByCityLikeAndStateLike('%' + params.city + '%', '%'+params.state+'%'), raceInstanceTotal: racetrack.Race.count()])
        }
         /**  */

        /** Segunda forma
        if(request.method == 'POST'){
            def criteria = racetrack.Race.createCriteria()

            def results = criteria{
                and {
                    like('city', '%' + params.city + '%')
                    like('state', '%' + params.state + '%')
                }
            }
            render(view:"list", model:[raceInstanceList:results, raceInstanceTotal: Race.count()])
        }  */

        if(request.method == 'POST'){
            RaceQuery query = new RaceQuery()
            bindData(query, params)
            def criteria = Race.createCriteria()

            def results = criteria{
                and {
                    like('city', '%' + params.city + '%')
                    like('state', '%' + params.state + '%')
                }
            }
            render(view:"list", model:[raceInstanceList:results, raceInstanceTotal: Race.count()])
        }

    }
}
