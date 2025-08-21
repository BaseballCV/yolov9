from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="yolov9",
    version="0.1.0",
    author="Wong Kin Yiu",
    author_email="", 
    description="A YOLO-based object detection implementation",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/dylandru/yolov9",
    packages=find_packages(),
    include_package_data=True,
    package_data={
        'yolov9': [
            'data/*.yaml',
            'data/hyps/*.yaml',
            '*.yaml',
            'models/detect/*.yaml',
            'models/detect/*.py',
            'scripts/*.sh'
        ]
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
    install_requires=[
        "gitpython",
        "ipython",
        "matplotlib>=3.2.2",
        "numpy>=1.18.5", 
        "opencv-python>=4.1.1",
        "Pillow>=7.1.2",
        "psutil",
        "PyYAML>=5.3.1",
        "requests>=2.23.0",
        "scipy>=1.4.1",
        "thop>=0.1.1",
        "torch>=2.6.0",
        "torchvision>=0.21.0",
        "tqdm>=4.64.0",
        "tensorboard>=2.4.1",
        "pandas>=1.1.4",
        "seaborn>=0.11.0",
        "albumentations>=1.0.3",
        "pycocotools>=2.0"
    ]
)