#!/usr/bin/env python3
'''Cache module'''
import uuid
import redis
from typing import Union, Callable, Optional


class Cache:
    '''Cache class'''
    def __init__(self):
        '''constructor'''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """A store method"""
        key = str(uuid.uuid4())

        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: Optional[Callable] = None) -> Union[str, bytes, int, float, None]:
        '''Retrieve data from Redis using the key'''
        data = self._redis.get(key)
        
        if data is None:
            return None
        
        if fn is not None:
            return fn(data)
        return data

    def get_str(self, key: str) -> Optional[str]:
        '''Decoding the returned byte'''
        return self.get(key, fn = lambda d: d.decode('utf-8'))

    def get_int(self, key: str) -> Optional[int]:
        '''Returning integer'''
        return self.get(key, fn = lambda d : int(d) if d is not None else None)
