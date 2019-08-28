
.PHONY: validate

venv:
	virtualenv -p python3 venv
	venv/bin/pip install yamllint jsonschema==2.6.0
	venv/bin/python --version
	venv/bin/pip freeze


validate: venv
	venv/bin/yamllint -d "{extends: default, rules: {line-length: {max: 130}}}" ./data
	venv/bin/python ./validate/validate.py
