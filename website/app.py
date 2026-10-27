import os

import psycopg2
from flask import Flask, render_template_string

app = Flask(__name__)

DB = {
    "host": os.environ["RDSHOST"],
    "port": int(os.environ.get("DB_PORT", "5432")),
    "dbname": os.environ.get("DB_NAME", "get_demo"),
    "user": os.environ.get("DB_USER", "getadmin"),
    "password": os.environ["DB_PASSWORD"],
    "sslmode": "require",
    "connect_timeout": 5,
}

PAGE = """
<!doctype html>
<title>People</title>
<h1>People in the database</h1>
<p> What a beautiful 90's style HTML table!</p>
{% if error %}
  <p style="color:red">Database error: {{ error }}</p>
{% else %}
  <table border="1" cellpadding="6" cellspacing="0">
    <tr><th>ID</th><th>First name</th><th>Last name</th><th>Favorite movie</th></tr>
    {% for r in rows %}
      <tr><td>{{ r[0] }}</td><td>{{ r[1] }}</td><td>{{ r[2] }}</td><td>{{ r[3] }}</td></tr>
    {% endfor %}
  </table>
{% endif %}
"""


@app.route("/")
def index():
    try:
        with psycopg2.connect(**DB) as conn, conn.cursor() as cur:
            cur.execute(
                "SELECT id, first_name, last_name, favorite_movie "
                "FROM movies ORDER BY id"
            )
            return render_template_string(PAGE, rows=cur.fetchall(), error=None)
    except Exception as exc:
        return render_template_string(PAGE, rows=[], error=str(exc)), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)