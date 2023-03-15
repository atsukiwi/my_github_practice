from importlib_metadata import version
from setuptools import find_packages, setup

setup(
    name="tasks",
    version="0.1.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
)
