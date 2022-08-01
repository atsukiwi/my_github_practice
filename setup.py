from importlib_metadata import version
from setuptools import setup, find_packages

setup(
    name="tasks",
    version="0.1.0",

    packages=find_packages(where='src'),
    package_dir={'': 'src'},
)
