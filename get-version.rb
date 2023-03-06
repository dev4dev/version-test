#!/usr/bin/env ruby

def get_build_number(prefix)
    # get latest number with our prefix
    version = `git ls-remote -q --tags --sort=-v:refname | grep 'refs/tags/#{prefix}/*' | head -n 1 | awk '{print $2}' | awk -F/ '{print $NF}'`.to_i
    
    loop do
      loop do
        version += 1
        # try to add a new tag with a new build number
        `git tag #{prefix}/#{version} &> /dev/null`
        break if $?.success?
      end
      # try to push the new tag
      `git push origin #{prefix}/#{version} &> /dev/null`
      
      pushed = $?.success?
      # remove the conflicting tag if push failed
      `git tag -d #{prefix}/#{version} &> /dev/null` unless pushed
      break if pushed
    end

    return version
end

puts get_build_number('build-no')
