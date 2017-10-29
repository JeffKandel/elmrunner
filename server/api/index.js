const router = require('express').Router()
module.exports = router

router.get('/:conditions', (req, res, next) => {
    const clothing = req.app.get('clothing'),
          conditions = req.params.conditions,
          items = clothing[conditions]

    res.json(items)
})

router.use((req, res, next) => {
  const error = new Error('Not Found')
  error.status = 404
  next(error)
})
