const ApiError = require('../error/ApiError')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { User } = require('../models/models')

const generateJwt = (user_id, user_login, roleRoleId) => {
    return jwt.sign({ user_id, user_login, roleRoleId },
        process.env.SECRET_KEY,
        { expiresIn: '1h' }
    )
}

class UserController {
    async delete(req, res, next) {
        try {
            const { user_id } = req.query
            const del = await User.destroy({ where: { user_id, roleRoleId: 2 } })
            return res.json(`deleted row(s): ${del}`)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async update(req, res, next) {
        try {
            const { user_id } = req.body
            const user = await User.findOne({
                where: { user_id }
            })
            const upd = user.update({ roleRoleId: 1 })
            return res.json(upd)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async getAll(req, res, next) {
        try {
            let users
            users = await User.findAll({
                where: {
                    roleRoleId: 2
                }
            })
            return res.json(users)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async registration(req, res, next) {
        try {
            const { user_login, user_password } = req.body
            if (!user_login || !user_password) {
                next(ApiError)
                return next(ApiError.badRequest('Некорректный логин или пароль'))
            }

            const candidate = await User.findOne({ where: { user_login } })
            if (candidate) {
                return next(ApiError.badRequest('Пользователь с таким логином уже существует'))
            }
            const hashPassword = await bcrypt.hash(user_password, 5)
            const user = await User.create({ user_login, user_password: hashPassword, roleRoleId: 2 })
            return res.json(user)
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async updPass(req, res, next) {
        try {
            const { user_id, user_password, userNewPassword } = req.body
            const user = await User.findOne({
                where: { user_id }
            })
            let comparePwd = bcrypt.compareSync(user_password, user.user_password)
            if (!comparePwd) {
                return next(ApiError.internal('Неверный пароль'))
            }
            const hashPassword = await bcrypt.hash(userNewPassword, 5)
            const updUser = await user.update({ user_password: hashPassword })

            const token = generateJwt(user.user_id, updUser.user_login, user.roleRoleId)
            return res.json({ token })
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async updLogin(req, res, next) {
        try {
            const { user_id, user_login } = req.body
            const user = await User.findOne({
                where: { user_id }
            })
            const candidate = await User.findOne({ where: { user_login } })
            if (candidate) {
                return next(ApiError.badRequest('Пользователь с таким логином уже существует'))
            }
            const updUser = await user.update({ user_login })
            const token = generateJwt(user.user_id, updUser.user_login, user.roleRoleId)
            return res.json({ token })
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async login(req, res, next) {
        try {
            const { user_login, user_password } = req.body
            if (!user_login || !user_password) {
                return next(ApiError.internal('Некорректный логин или пароль'))
            }

            const user = await User.findOne({ where: { user_login } })
            if (!user) {
                return next(ApiError.internal('Пользователь с таким логином не найден'))
            }
            let comparePwd = bcrypt.compareSync(user_password, user.user_password)
            if (!comparePwd) {
                return next(ApiError.internal('Неверный пароль'))
            }
            const token = generateJwt(user.user_id, user.user_login, user.roleRoleId)
            return res.json({ token })
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }

    async check(req, res, next) {
        try {
            const token = generateJwt(req.user.user_id, req.user.user_login, req.user.roleRoleId)
            return res.json({ token })
        } catch (error) {
            next(ApiError.badRequest(error.message))
        }
    }
}

module.exports = new UserController()