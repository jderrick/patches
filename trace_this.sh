#!/bin/sh
trace="/sys/kernel/debug/tracing/"
default_tracer="function_graph"

#set current tracer if nop set
if [[ $(< $trace/current_tracer) == "nop" ]]; then
	echo $default_tracer > $trace/current_tracer
fi

#disable tracer and clear current trace
echo 0 > $trace/tracing_on
echo > $trace/trace

#enable tracer, execute command (redirecting to stderr), and disable tracer
echo 1 > $trace/tracing_on
$* 1>&2
echo 0 > $trace/tracing_on

#if stdout is a redirect, cat trace file to redirect
#otherwise, find trace in /sys/kernel/debug/tracing/trace
if [ ! -t 1 ]; then
	cat $trace/trace
fi

exit 0
