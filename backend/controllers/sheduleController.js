const { Shedule, Course } = require('../models/models.js')
const ApiError = require('../error/ApiError')

class SheduleController {
    async create(req, res, next) {
        try {
            const { course_id } = req.params
            let { course_shedule, courseCourseId } = req.body
            course_shedule = JSON.parse(course_shedule)

            course_shedule.forEach(i =>
                Shedule.create({
                    shedule_dateofstart: i.shedule_dateofstart,
                    shedule_dateoffinish: i.shedule_dateoffinish,
                    courseCourseId: courseCourseId
                })
            )

            return res.json()

        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async get(req, res, next) {
        try {
            const { courseCourseId } = req.query
            let shedules
            if (!courseCourseId) {
                shedules = await Shedule.findAll({
                    order: [
                        ['shedule_dateofstart', 'DESC']
                    ],
                    include: [{
                        model: Course // will create a left join
                    }]
                })
            } else {
                shedules = await Shedule.findAll({
                    order: [
                        ['shedule_dateofstart', 'DESC']
                    ],
                    include: [{
                        model: Course // will create a left join
                    }],
                    where: { courseCourseId }
                })
            }
            return res.json(shedules)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async delete(req, res, next) {
        try {
            const { shedule_id } = req.query
            const del = await Shedule.destroy({ where: { shedule_id } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new SheduleController()