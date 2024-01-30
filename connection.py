#!/usr/bin/python3

import os
import json
import psycopg2

from sqlalchemy import create_engine

def config(param):
    path = os.getcwd()
    with open(path+'/'+'config.json') as file:
        conf = json.load(file)[param]
    return conf

def source_conn():
    conf = config('marketplace_prod')
    try:
        conn = psycopg2.connect(host=conf['host'],
                                database=conf['db'],
                                user=conf['user'],
                                password=conf['password']
                                )
        print(f"[INFO] Success connect Source ......")
        engine = create_engine(f"postgresql+psycopg2://{conf['user']}:{conf['password']}@{conf['host']}/{conf['db']}")
        return conn, engine
    except:
        print(f"[INFO] Can't connect Source .....")

def dwh_conn():
    conf = config('dwh_project_3')
    try:
        conn = psycopg2.connect(host=conf['host'],
                                database=conf['db'],
                                user=conf['user'],
                                password=conf['password']
                                )
        print(f"[INFO] Success connect Data Warehouse ......")
        engine = create_engine(f"postgresql+psycopg2://{conf['user']}:{conf['password']}@{conf['host']/{conf['db']}}")
        return conn, engine
    except:
        print(f"[INFO] Can't connect Data Warehouse .....")