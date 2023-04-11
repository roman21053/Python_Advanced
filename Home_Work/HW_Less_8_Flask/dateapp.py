from flask import Flask, abort
from datetime import datetime
import pytz

app = Flask(__name__)

@app.route('/datetime')
def get_instructions():
    instructions = '<p>To get the current time in the GMT time zone, add the time zone number in +2 format.</p>' \
                   '<p>/datetime/+2/</p>' \
                   '<p>The timezone number must be in the range -12 to +14!</p>' \
                   '<p>For a route without parameters, the time in the current time zone will be shown</p>' \
                   '<p>/datetime/</p>'
    return instructions


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