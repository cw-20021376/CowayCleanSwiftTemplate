#import os
#import sys
#import urllib
#import csv
#
#reload(sys)
#sys.setdefaultencoding('utf-8')
#
#gdoc_id = "1FS4rRrd9uzyp3ZUJRLKxBXlMFmSMgmT3jxnFpxR9y5k/edit#gid=0"
#languages = ["kr", "ja"]
#
#def get_gdoc_information():
#    download_path = sys.argv[1]
#    try:
#        csv_file = export_csv_from_sheet(gdoc_id)
#        for language in languages:
#            string_list = get_strings_from_csv(language, download_path, csv_file)
#            write_strings(language, string_list, download_path)
#    except Exception as e:
#        print(":::::::::::::ERROR:::::::::::::")
#        print(e)
#
#
#def export_csv_from_sheet(gdoc_id, download_path=None, ):
#    print("Downloading the CVS file with id %s" % gdoc_id)
#
#    resource = gdoc_id.split('/')[0]
#    tab = gdoc_id.split('#')[1].split('=')[1]
#    resource_id = 'spreadsheet:' + resource
#
#    if download_path is None:
#        download_path = os.path.abspath(os.path.dirname(__file__))
#
#    file_name = os.path.join(download_path, '%s.csv' % (resource))
#
#    print('download_path : %s' % download_path)
#    print('Downloading spreadsheet to %s' % file_name)
#
#    url = 'https://docs.google.com/spreadsheet/ccc?key=%s&output=csv&gid=%s' % (resource, tab)
#
##    file = urllib.urlopen(url).read()
##    with open(file_name, "w+") as f:
##        f.write(file.decode('UTF-8'))
##        f.close()
#    urllib.urlretrieve(url, file_name)
#
#    print("Download Completed!")
#
#    return file_name
#
#
#def get_strings_from_csv(language, savepath, file_name):
#    print("read CSV file : %s" % file_name)
#
#    source_csv = open(file_name, "r")
#    csv_reader = csv.reader(source_csv)
#    header = csv_reader.next()
#    index_key = header.index("key")
#    index_language = header.index(language)
#
#    string_list = []
#    # Loop through the lines in the file and get each coordinate
#    for row in csv_reader:
#        key = row[index_key]
#        language_value = row[index_language]
#
#        dict_string = {
#            "key": key,
#            language: language_value
#        }
#        string_list.append(dict_string)
#
#    source_csv.close()
#    os.remove(file_name)
#
#    return string_list
#
#
#def write_strings(language, string_list, save_path):
#    if not os.path.exists(save_path + "/" + language + ".lproj/"):
#        os.makedirs(save_path + "/" + language + ".lproj/")
#
#    string_file = open(save_path + "/" + language + ".lproj/Localization.strings", "w")
#
#    for item in string_list:
#        string_file.write("\"" + item["key"] + "\" = \"" + item[language] + "\";\n")
#
#    string_file.close()
#
#
#if __name__ == '__main__':
#    get_gdoc_information()


import os
import sys
import urllib
import csv

reload(sys)
sys.setdefaultencoding('utf-8')

gdoc_id = "1FS4rRrd9uzyp3ZUJRLKxBXlMFmSMgmT3jxnFpxR9y5k/edit#gid=0"


def get_gdoc_information():
    download_path = sys.argv[1]
    try:
        csv_file = export_csv_from_sheet(gdoc_id)
        string_list = get_strings_from_csv(download_path, csv_file)
        write_strings(string_list, download_path)
    except Exception as e:
        print(":::::::::::::ERROR:::::::::::::")
        print(e)


def export_csv_from_sheet(gdoc_id, download_path=None, ):
    print("Downloading the CVS file with id %s" % gdoc_id)

    resource = gdoc_id.split('/')[0]
    tab = gdoc_id.split('#')[1].split('=')[1]
    resource_id = 'spreadsheet:' + resource

    if download_path is None:
        download_path = os.path.abspath(os.path.dirname(__file__))

    file_name = os.path.join(download_path, '%s.csv' % (resource))

    print('download_path : %s' % download_path)
    print('Downloading spreadsheet to %s' % file_name)

    url = 'https://docs.google.com/spreadsheet/ccc?key=%s&output=csv&gid=%s' % (resource, tab)
#    url = 'https://docs.google.com/spreadsheets/d/%s/gviz/tq?tqx=out:csv&sheet=st1' % (resource)
#    'https://docs.google.com/spreadsheets/d/{{ID}}/gviz/tq?tqx=out:csv&sheet={{sheet_name}}'

#    url = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSj_b1nC-X-Luv-uggoyRMBwE72UKOu8p9rRKC_Q58UMKLy6d-SwR3mydCSGkVERDG5PDdqYHJw4e_k/csv'
    urllib.urlretrieve(url, file_name)
#    response = urllib.urlopen(url)
#    cr = csv.reader(response)
#
#    for row in cr:
#        print row
    

    print("Download Completed!")

    return file_name


def get_strings_from_csv(savepath, file_name):
    print("read CSV file : %s" % file_name)

    source_csv = open(file_name, "r")
    csv_reader = csv.reader(source_csv)
    header = csv_reader.next()
    index_key = header.index("key")
    index_kr = header.index("kr")

    string_list = []

    # Loop through the lines in the file and get each coordinate
    for row in csv_reader:
        key = row[index_key]
        kr = row[index_kr]

        dict_string = {
            "key": key,
            "kr": kr
        }
        string_list.append(dict_string)

    source_csv.close()
    os.remove(file_name)

    return string_list


def write_strings(string_list, save_path):
    if not os.path.exists(save_path + "/en.lproj/"):
        os.makedirs(save_path + "/en.lproj/")

    string_file = open(save_path + "/en.lproj/Localization.strings", "w")

    for item in string_list:
        string_file.write("\"" + item["key"] + "\" = \"" + item["kr"] + "\";\n")

    string_file.close()


if __name__ == '__main__':
    get_gdoc_information()
