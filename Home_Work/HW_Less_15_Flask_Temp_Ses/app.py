from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = "sadasdsdssadsadsadsadsadssaddas"
# db = SQLAlchemy()

# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:vedmeduk21053@localhost:3306/flask'

# db.init_app(app)

# with app.app_context():
#     from routes import *
#     from models import User
#
#     db.create_all()


if __name__ == '__main__':
    import logging

    app.logger.setLevel(logging.DEBUG)
    app.run(host='127.0.0.1', port=5000, debug=True)
