from setuptools import setup, find_packages

setup(
    name="MotionGPT",
    version="0.1.0",
    author="Biao Jiang and Xin Chen",
    author_email="jiangb22@m.fudan.edu.cn",
    description="MotionGPT: Human motion as a foreign language.",
    packages=find_packages(exclude=("configs", "deps")),
    python_requires=">=3.8",
    install_requires=[
        "torch",
        "numpy",
        "tqdm",
    ],
)
