from .utility cimport pair

cdef extern from "<map>" namespace "std" nogil:
    cdef cppclass map[T, U]:
        cppclass iterator:
            pair[T, U]& operator*()
            iterator operator++()
            iterator operator--()
            bint operator==(iterator)
            bint operator!=(iterator)
        cppclass const_iterator:
            pair[const T, U]& operator*()
            const_iterator operator++()
            const_iterator operator--()
            bint operator==(const_iterator)
            bint operator!=(const_iterator)
        cppclass reverse_iterator:
            pair[T, U]& operator*()
            iterator operator++()
            iterator operator--()
            bint operator==(reverse_iterator)
            bint operator!=(reverse_iterator)
        #cppclass const_reverse_iterator(reverse_iterator):
        #    pass
        map() except +
        map(map&) except +
        #map(key_compare&)
        U& operator[](T&)
        #map& operator=(map&)
        bint operator==(map&, map&)
        bint operator!=(map&, map&)
        bint operator<(map&, map&)
        bint operator>(map&, map&)
        bint operator<=(map&, map&)
        bint operator>=(map&, map&)
        U& at(const T&) except +
        iterator begin()
        const_iterator const_begin "begin" ()
        void clear()
        size_t count(const T&)
        bint empty()
        iterator end()
        const_iterator const_end "end" ()
        pair[iterator, iterator] equal_range(const T&)
        #pair[const_iterator, const_iterator] equal_range(key_type&)
        void erase(iterator)
        void erase(iterator, iterator)
        size_t erase(const T&)
        iterator find(const T&)
        const_iterator const_find "find" (const T&)
        pair[iterator, bint] insert(pair[T, U]) except + # XXX pair[T,U]&
        iterator insert(iterator, pair[T, U]) except + # XXX pair[T,U]&
        #void insert(input_iterator, input_iterator)
        #key_compare key_comp()
        iterator lower_bound(const T&)
        #const_iterator lower_bound(const key_type&)
        size_t max_size()
        reverse_iterator rbegin()
        #const_reverse_iterator rbegin()
        reverse_iterator rend()
        #const_reverse_iterator rend()
        size_t size()
        void swap(map&)
        iterator upper_bound(const T&)
        #const_iterator upper_bound(const key_type&)
        #value_compare value_comp()