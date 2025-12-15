const sequelize = require('../db')
const { DataTypes } = require('sequelize')
const moment = require('moment')

const User = sequelize.define('user', {
    user_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    user_login: { type: DataTypes.STRING, unique: true, allowNull: false },
    user_password: { type: DataTypes.STRING, allowNull: false },
})

const Role = sequelize.define('role', {
    role_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    role_name: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Course = sequelize.define('course', {
    course_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    course_name: { type: DataTypes.STRING(300), unique: true, allowNull: false },
    course_duration: { type: DataTypes.INTEGER, allowNull: false },
    course_price: { type: DataTypes.INTEGER, allowNull: false },
    course_pdf: { type: DataTypes.STRING() }
})

const Type = sequelize.define('type', {
    type_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    type_name: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Shedule = sequelize.define('shedule', {
    shedule_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    shedule_dateofstart: {
        allowNull: false,
        type: DataTypes.DATEONLY,
        get: function () {
            return moment.utc(this.getDataValue('shedule_dateofstart')).format('DD.MM.YYYY');
        }
    },
    shedule_dateoffinish: {
        allowNull: false,
        type: DataTypes.DATEONLY,
        get: function () {
            return moment.utc(this.getDataValue('shedule_dateoffinish')).format('DD.MM.YYYY');
        }
    }
})

const Format = sequelize.define('format', {
    format_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    format_name: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Document = sequelize.define('document', {
    document_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    document_name: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Module = sequelize.define('module', {
    module_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    module_name: { type: DataTypes.STRING, allowNull: false },
})

const License = sequelize.define('license', {
    license_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    license_name: { type: DataTypes.STRING(400), unique: true, allowNull: false },
    license_file: { type: DataTypes.STRING },
    license_type: { type: DataTypes.INTEGER }
})

const Mail = sequelize.define('mail', {
    mail_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    mail_name: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Service = sequelize.define('service', {
    service_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    service_title: { type: DataTypes.STRING, unique: true, allowNull: false },
    service_optionTitle: { type: DataTypes.STRING, allowNull: false },
    service_description: { type: DataTypes.STRING(450) },
})

const Option = sequelize.define('option', {
    option_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    option_name: { type: DataTypes.STRING, allowNull: false }
})

const TypeOfService = sequelize.define('typeofservice', {
    typeofservice_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    typeofservice_title: { type: DataTypes.STRING, unique: true, allowNull: false }
})

const Request = sequelize.define('request', {
    request_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    request_type: { type: DataTypes.BOOLEAN, allowNull: false },
    request_time: {
        type: DataTypes.DATE, defaultValue: DataTypes.NOW,
        get: function () {
            return moment.utc(this.getDataValue('shedule_dateofstart')).format('DD.MM.YYYY');
        }
    },
    request_message: { type: DataTypes.STRING }
})

const Personal = sequelize.define('personal', {
    personal_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    personal_lastname: { type: DataTypes.STRING(20), allowNull: false },
    personal_name: { type: DataTypes.STRING(20), allowNull: false },
    personal_surname: { type: DataTypes.STRING(20) },
    personal_phone: { type: DataTypes.STRING(20), allowNull: false },
    personal_email: { type: DataTypes.STRING(40), allowNull: false }
})

const Firm = sequelize.define('firm', {
    firm_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    firm_name: { type: DataTypes.STRING(20), allowNull: false },
    firm_represantivename: { type: DataTypes.STRING(20), allowNull: false },
    firm_phone: { type: DataTypes.STRING(20), allowNull: false },
    firm_email: { type: DataTypes.STRING(40), allowNull: false }
})

const Member = sequelize.define('member', {
    member_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    member_lastname: { type: DataTypes.STRING(20), allowNull: false },
    member_name: { type: DataTypes.STRING(20), allowNull: false },
    member_surname: { type: DataTypes.STRING(20) },
    member_jobtitle: { type: DataTypes.STRING(40) },
    member_email: { type: DataTypes.STRING(40) }
})

Type.hasMany(Course, {
    foreignKey: {
        allowNull: false
    }
})
Course.belongsTo(Type)

Role.hasMany(User, {
    foreignKey: {
        allowNull: false
    }
})
User.belongsTo(Role)

Document.hasMany(Course, {
    foreignKey: {
        allowNull: false
    }
})
Course.belongsTo(Document)

Course.hasMany(Shedule, {
    as: 'course_shedule',
    onDelete: 'CASCADE',
    hooks: true
})
Shedule.belongsTo(Course)

Format.hasMany(Course, {
    foreignKey: {
        allowNull: false
    }
})
Course.belongsTo(Format)

Course.hasMany(Module, {
    as: 'course_module',
    onDelete: 'CASCADE',
    hooks: true
})
Module.belongsTo(Course)

TypeOfService.hasMany(Service)
Service.belongsTo(TypeOfService)

Service.hasMany(Option, {
    as: 'service_option'
})
Option.belongsTo(Service)

Shedule.hasMany(Request, {
    onDelete: 'SET NULL',
    hooks: true
})
Request.belongsTo(Shedule)

Firm.hasMany(Request, {
    as: 'request_firm',
    onDelete: 'CASCADE',
    hooks: true
})
Request.belongsTo(Firm)

Personal.hasMany(Request,
    {
        onDelete: 'CASCADE',
        hooks: true
    })
Request.belongsTo(Personal, {
    onDelete: 'CASCADE',
    hooks: true
})

Firm.hasMany(Member, {
    as: 'firm_member',
    onDelete: 'CASCADE',
    hooks: true
})
Member.belongsTo(Firm)

module.exports = {
    User,
    Course,
    Type,
    Shedule,
    Document,
    Format,
    Module,
    Option,
    Service,
    TypeOfService,
    License,
    Request,
    Personal,
    Firm,
    Member,
    Mail,
    Role
}