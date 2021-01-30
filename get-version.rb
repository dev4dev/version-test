#!/usr/bin/env ruby

# result = `git tag build-no/20 &> /dev/null`
#
# p result
# p $?.success?

def get_version
    prefix = 'build-no'

    `git fetch --all --tags &> /dev/null`
    version = `git tag -l --sort=-v:refname #{prefix}* | head -n 1 | awk '{ split($0, a, "/"); print a[2]}'`.to_i
    
    loop do
      loop do
        version += 1
        puts "setting #{version}"
        `git tag #{prefix}/#{version} &> /dev/null`
        break if $?.success?
      end
      puts "pushing #{version}"
      `git push origin --tags &> /dev/null`
      break if $?.success?
    end

    return version
end

puts get_version()
