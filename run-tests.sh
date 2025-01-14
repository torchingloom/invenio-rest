#!/usr/bin/env sh
# -*- coding: utf-8 -*-
#
# This file is part of Invenio.
# Copyright (C) 2015-2020 CERN.
#
# Invenio is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.

# Quit on errors
set -o errexit

# Quit on unbound symbols
set -o nounset

pydocstyle invenio_rest tests docs
isort invenio_rest tests --check-only --diff
check-manifest --ignore ".*-requirements.txt"
sphinx-build -qnNW docs docs/_build/html
pytest
