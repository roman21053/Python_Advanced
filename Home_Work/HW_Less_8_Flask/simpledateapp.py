from flask import Flask, abort
from datetime import datetime
import pytz

app = Flask(__name__)


@app.route('/datetime/')
@app.route('/datetime/<timezone>/')
def get_datetime(timezone='+3'):
    try:
        int(timezone)
    except ValueError:
        abort(406, 'The parameter entered for the GMT zone is not a number!')
    date_time = datetime.now()
    if 15 > int(timezone) >= 0:
        timezone_name = f'-{int(timezone)}'
    elif -13 < int(timezone) < 0:
        timezone_name = f'+{-int(timezone)}'
    else:
        abort(406, 'The timezone number must be in the range -12 to 14!')
    date_time = date_time.astimezone(pytz.timezone('Etc/GMT' + timezone_name))
    return date_time.strftime('%Y-%m-%d %H:%M:%S')


if __name__ == '__main__':
    import logging
    app.logger.setLevel(logging.DEBUG)
    app.run(host='127.0.0.1', port=5000, debug=True)