import pandas as pd
import os


location = input("Enter location to scan\n=> ")
os.chdir(location)
for (root, dir, files) in os.walk(location):
    for file1 in range(len(files)):
        try:
            if ".xlsx" in files[file1]:

                df = pd.read_excel(os.path.join(os.path.abspath(root), files[file1]))
                for file2 in range(len(files)):
                    if ".xlsx" in files[file2] and file1!=file2:
                        df2 = pd.read_excel(os.path.join(os.path.abspath(root), files[file2 ]))

                        if len(df.columns)==len(df2.columns) and len(df.index)==len(df2.index):
                            os.remove(os.path.join(os.path.abspath(root), files[file1]))
        except Exception as e:
            print("File Deleted!", os.path.join(os.path.abspath(root), files[file1]))

