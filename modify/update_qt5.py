# package info from nixos
# https://github.com/coreyoconnor/nixpkgs/blob/2e995b69d666f694bc16a7783f73e2937b83191d/pkgs/development/libraries/qt-5/5.15/srcs-generated.json

from os import path, remove
from re import search
from io import StringIO
from lxml import etree
from browser import get_browser_driver
from argparse import ArgumentParser

PWD = path.dirname(path.abspath(__file__))

def modify_qt5_submodule(root, pkg, version):
    qt5path = path.join(root, "package/qt5")
    buildroot_name = qt_to_buildroot(pkg)
    makefile = path.join(qt5path, f"{buildroot_name}/{buildroot_name}.mk")
    hashfile = path.join(qt5path, f"{buildroot_name}/{buildroot_name}.hash")
    # 修改makefile
    if path.exists(makefile):
        newmk = StringIO()
        ignored = False
        with open(makefile, "r") as f:
            while line := f.readline():
                matches = search(f"{buildroot_name.upper()}_VERSION = (.*)", line)
                if matches:
                    newmk.write(f"{buildroot_name.upper()}_VERSION = {version}\n")
                else:
                    newmk.write(line)
                matches = search(r".*_IGNORE_HASH_ERRORS = (.*)", line)
                if matches:
                    ignored = matches.group(1).lower() == "yes"
        if not ignored:
            newmk.write(f"{buildroot_name.upper()}_IGNORE_HASH_ERRORS = YES\n")
        with open(makefile, "w") as f:
            f.write(newmk.getvalue())

    # 删除hash
    if path.exists(hashfile):
        remove(hashfile)


def qt_to_buildroot(name):
    matches = search(r"qt(.*)", name)
    if matches:
        return f"qt5{matches.group(1)}"
    else:
        return name

parser = ArgumentParser()
parser.add_argument("root", help="buildroot root directory")

def qt5modules_info(url) -> dict:
    info = {}
    driver = get_browser_driver(["--headless"])
    subgit = "//a[@class[contains(., 'commit-sha')]]"
    driver.get(url)
    driver.implicitly_wait(10)
    tree = etree.HTML(driver.page_source)
    for submodule in tree.xpath(subgit):
        matches = search(r"/qt/qt/(.*)/-/tree/(.*)", submodule.get("href"))
        if matches:
            info[matches.group(1)] = matches.group(2)
    driver.quit()
    return info


if __name__ == "__main__":
    args = parser.parse_args()
    pkgs = qt5modules_info(
        "https://invent.kde.org/qt/qt/qt5/-/tree/v5.15.15-lts-lgpl?ref_type=tags"
    )
    for pkg, version in pkgs.items():
        modify_qt5_submodule(args.root, pkg, version)