# virtualenv

### The basic idea of virtualenv

1.  copying python related executables and libs to an assigned folder
2.  setup corresponding environment
3.  prefix the prompt so the client can know the name of environment

so the user can work in the folder as in an isolated environment. Now, if we use pip install in the environment, the package will only be installed in the environment. With virtualenv, we can keep our system environment clean.

Because the virtual env bases on the folder, we can remove the virtual env by just removing the folder.

### The steps to use virtualenv

1.  pip install virtualenv
2.  virtaulenv `dirname`
    *  If you want to assign specific python version (python2.7, python3.7, pypy, etc), use `-p <python bin path>`
    *  In default, the environment will contain the python libs in system. If you do not need these python libs, use `--no-site-packages`
2.  cd `dirname`
3.  source `bin/activate`
4.  ...work here
5.  use `deactivate` to quit the environment

### Memo
An environment variable `PIP_REQUIRE_VIRTUALENV` is used to check if pip is run under virtual env.

# cookbooks

### use argv

    import sys
    if __name__ == '__main__':
        """
        python test.py 1 2 3
        ['test.py', '1', '2', '3']
        """
        print sys.argv

### http getter
*  https://github.com/psf/requests is a very well-designed library comparing to `urllib/urllib2`
*  note that chrome's developer tool might add extra tags (i.g. tbody) in copied xpath.
*  note that index of td begins from 1

##### example code

    import requests
    response = requests.get('http://service.example.com', auth=('user', 'password'))

    print(response.text)
    # print(response.content)
    
    from lxml import etree
    
    html = etree.HTML(response.content)
    text_in_the_font_tag = html.xpath("/html/body/table/tr[1]/td/table/tr/td[3]/font/text()")
    print(text_in_the_font_tag)
