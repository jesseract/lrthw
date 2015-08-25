module Dict
  def Dict.new(num_buckets=256)
    #initializes a Dict with the given number of buckets
    aDict = []
    (0...num_buckets).each do |i|
      aDict.push([])
    end

    return aDict
  end

  def Dict.hash_key(aDict, key)
    #Given a key, this will create a number and then convert it to an index for the aDict's buckets
    return key.hash % aDict.length
  end

  def Dict.get_bucket(aDict, key)
    #given a key, find the bucket where it would go
    bucket_id = Dict.hash_key(aDict, key)
    return aDict[bucket_id]
  end

  def Dict.get_slot(aDict, key, default=nil)
    #returns the index, key and value of a slot found in a bucket
    bucket = Dict.get_bucket(aDict, key)

    bucket.each_with_index do |kv, i|
      k, v = kv
      if key == k
        return i, k, v
      end
    end

    return -1, key, default
  end

  def Dict.get(aDict, key, default=nil)
    #gets the value in a bucket for the given key, or the default
    i, k, v = Dict.get_slot(aDict, key, default=default)
    return v
  end

  def Dict.set(aDict, key, value)
    #sets the key to the value, replacing any existing value
    bucket = Dict.get_bucket(aDict, key)
    i, k, v = Dict.get_slot(aDict, key)

    if i >= 0
      bucket[i] = [key, value]
    else
      bucket.push([key, value])
    end
  end

  def Dict.delete(aDict, key)
    #deletes the given key from the dict
    bucket = Dict.get_bucket(aDict, key)

    (0...bucket.length).each do |i|
      k, v = bucket[i]
      if key == k
        bucket.delete_at(i)
        break
      end
    end
  end

  def Dict.list(aDict)
    #prints out what's in the dict
    aDict.each do |bucket|
      if bucket.each {|k, v| puts k, v}
      end
    end
  end
end
