import os
from flask import Flask
import requests

app = Flask(__name__)

@app.route('/github')
def github_api():
    try:
      response = requests.get("https://api.github.com/")
      response.raise_for_status() # Raise HTTPError for bad responses (4xx or 5xx)
      return f"Connected to Github, response: {response.json()}"
    except requests.exceptions.RequestException as e:
      return f"Error connecting to Github: {e}", 500

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
