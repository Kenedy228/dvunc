const {
  Course,
  Module,
  Shedule,
  Type,
  Format,
  Document,
} = require("../models/models.js");
const ApiError = require("../error/ApiError");
const uuid = require("uuid");
const path = require("path");
const fs = require("fs");

class CourseController {
  async create(req, res, next) {
    try {
      let {
        course_name,
        typeTypeId,
        course_duration,
        course_shedule,
        formatFormatId,
        documentDocumentId,
        course_price,
        course_module,
      } = req.body;

      let fileName = ".pdf";

      if (req.files != null) {
        const { course_pdf } = req.files;
        fileName = uuid.v4() + ".pdf";
        course_pdf.mv(path.resolve(__dirname, "..", "static", fileName));
      }

      const candidate = await Course.findOne({ where: { course_name } });
      if (candidate) {
        return next(
          ApiError.badRequest("Курс с таким названием уже существует"),
        );
      }
      const course = await Course.create({
        course_name,
        typeTypeId,
        course_duration,
        documentDocumentId,
        formatFormatId,
        course_price,
        course_pdf: fileName,
      });

      if (course_module) {
        course_module = JSON.parse(course_module);
        course_module.forEach((i) => {
          Module.create({
            module_name: i.module_name,
            courseCourseId: course.course_id,
          });
          //i.addSubject(j)
        });
      }

      if (course_shedule) {
        course_shedule = JSON.parse(course_shedule);
        course_shedule.forEach((i) =>
          Shedule.create({
            shedule_dateofstart: i.shedule_dateofstart,
            shedule_dateoffinish: i.shedule_dateoffinish,
            courseCourseId: course.course_id,
          }),
        );
      }

      return res.json(course);
    } catch (error) {
      next(ApiError.badRequest(error.message));
    }
  }

  async update(req, res, next) {
    try {
      const { course_id } = req.params;
      let {
        course_name,
        typeTypeId,
        course_duration,
        formatFormatId,
        documentDocumentId,
        course_price,
      } = req.body;

      const course = await Course.findOne({
        where: { course_id },
      });
      const courseUpd = course.update({
        course_name,
        typeTypeId,
        course_duration,
        formatFormatId,
        documentDocumentId,
        course_price,
      });
      if (req.files != null) {
        const { course_pdf } = req.files;

        fs.access(
          path.resolve(__dirname, "..", "static", course.course_pdf),
          function (error) {
            if (error) {
              let fileName = uuid.v4() + ".pdf";
              course_pdf.mv(path.resolve(__dirname, "..", "static", fileName));
              course.update({ course_pdf: fileName });
            } else {
              fs.unlinkSync(
                path.resolve(__dirname, "..", "static", course.course_pdf),
              );
              course_pdf.mv(
                path.resolve(__dirname, "..", "static", course.course_pdf),
              );
            }
          },
        );
      }

      return res.json(courseUpd);
    } catch (error) {
      next(ApiError.badRequest(error.message));
    }
  }

  async get(req, res, next) {
    try {
      const { typeTypeId } = req.query;
      let courses;
      if (!typeTypeId) {
        courses = await Course.findAll({
          include: [{ model: Type }],
        });
      } else {
        courses = await Course.findAll({
          include: [
            {
              model: Type, // will create a left join
            },
          ],
          where: { typeTypeId },
          order: [["course_id", "ASC"]],
        });
      }
      return res.json(courses);
    } catch (error) {
      next(ApiError.badRequest(error.message));
    }
  }

  async getOne(req, res, next) {
    try {
      const { course_id } = req.params;
      const course = await Course.findOne({
        where: { course_id },
        include: [
          { model: Type },
          { model: Document },
          { model: Format, as: "format" },
          { model: Module, as: "course_module" },
          { model: Shedule, as: "course_shedule" },
        ],
      });
      return res.json(course);
    } catch (error) {
      next(ApiError.badRequest(error.message));
    }
  }

  async delete(req, res, next) {
    try {
      const { course_id } = req.query;
      const course = await Course.findOne({
        where: { course_id },
      });

      if (course.course_pdf !== null) {
        fs.access(
          path.resolve(__dirname, "..", "static", course.course_pdf),
          function (error) {
            if (error) {
              console.log("Файл не найден");
            } else {
              fs.unlinkSync(
                path.resolve(__dirname, "..", "static", course.course_pdf),
              );
            }
          },
        );
      }

      const del = await Course.destroy({ where: { course_id } });
      return res.json(`deleted row(s): ${del}`);
    } catch (error) {
      next(ApiError.badRequest(error.message));
    }
  }
}

module.exports = new CourseController();
