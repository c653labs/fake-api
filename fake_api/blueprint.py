from flask import Blueprint, jsonify, request, render_template
import pendulum

requests = []

bp = Blueprint('app', __name__)


@bp.route('/', methods=['GET'])
def index():
    return render_template('index.jinja2', requests=requests)


@bp.route('/favicon.ico', methods=['GET'])
def favicon():
    return '', 204


@bp.route('/', defaults=dict(path=''), methods=['POST', 'PUT', 'DELETE', 'OPTIONS'])
@bp.route('/<path:path>', methods=['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'])
def catch_all(path):
    global requests

    req = dict(
        timestamp=pendulum.now(),
        path=path,
        method=request.method,
        form=dict(request.form.items()),
        body=request.data.decode('utf-8'),
        json=request.json,
        headers=dict(request.headers.items()),
    )
    requests = [req] + requests[:20]

    return jsonify(req)
